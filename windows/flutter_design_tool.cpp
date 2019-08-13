// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <iostream>
#include <string>
#include <vector>

#include "flutter/flutter_window_controller.h"

// Include windows.h last, to minimize potential conflicts. The CreateWindow
// macro needs to be undefined because it prevents calling
// FlutterWindowController's method.
#include <windows.h>
#undef CreateWindow

namespace {

// Returns the path of the directory containing this executable, or an empty
// string if the directory cannot be found.
std::string GetExecutableDirectory() {
  char buffer[MAX_PATH];
  if (GetModuleFileName(nullptr, buffer, MAX_PATH) == 0) {
    std::cerr << "Couldn't locate executable" << std::endl;
    return "";
  }
  std::string executable_path(buffer);
  size_t last_separator_position = executable_path.find_last_of('\\');
  if (last_separator_position == std::string::npos) {
    std::cerr << "Unabled to find parent directory of " << executable_path
              << std::endl;
    return "";
  }
  return executable_path.substr(0, last_separator_position);
}

}  // namespace

int main(int argc, char **argv) {
  // Resources are located relative to the executable.
  std::string base_directory = GetExecutableDirectory();
  if (base_directory.empty()) {
    base_directory = ".";
  }
  std::string data_directory = base_directory + "\\data";
  std::string assets_path = data_directory + "\\flutter_assets";
  std::string icu_data_path = data_directory + "\\icudtl.dat";

  // Arguments for the Flutter Engine.
  std::vector<std::string> arguments;

  flutter::FlutterWindowController flutter_controller(icu_data_path);

  // Start the engine.
  if (!flutter_controller.CreateWindow(1200, 720, "Flutter Design Tool",
                                       assets_path, arguments)) {
    return EXIT_FAILURE;
  }

  // Run until the window is closed.
  flutter_controller.RunEventLoop();
  return EXIT_SUCCESS;
}
