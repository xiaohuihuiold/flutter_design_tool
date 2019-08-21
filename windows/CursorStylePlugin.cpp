// Copyright 2019 Google LLC
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
#include "CursorStylePlugin.h"

#include <windows.h>

#include <VersionHelpers.h>
#include <flutter/method_channel.h>
#include <flutter/plugin_registrar.h>
#include <flutter/standard_method_codec.h>
#include <memory>
#include <sstream>

namespace {

    class CursorStylePlugin : public flutter::Plugin {
    public:
        static void RegisterWithRegistrar(flutter::PluginRegistrar* registrar);

        // Creates a plugin that communicates on the given channel.
        CursorStylePlugin(
            std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> channel);

        virtual ~CursorStylePlugin();

    private:
        // Called when a method is called on |channel_|;
        void HandleMethodCall(
            const flutter::MethodCall<flutter::EncodableValue>& method_call,
            std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

        // The MethodChannel used for communication with the Flutter engine.
        std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> channel_;
    };

    // static
    void CursorStylePlugin::RegisterWithRegistrar(flutter::PluginRegistrar* registrar) {
        auto channel =
            std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
                registrar->messenger(), "com.xhhold.flutter.tool.design/plugin/cursor_style",
                &flutter::StandardMethodCodec::GetInstance());
        auto* channel_pointer = channel.get();

        auto plugin = std::make_unique<CursorStylePlugin>(std::move(channel));

        channel_pointer->SetMethodCallHandler(
            [plugin_pointer = plugin.get()](const auto& call, auto result) {
            plugin_pointer->HandleMethodCall(call, std::move(result));
        });

        registrar->AddPlugin(std::move(plugin));
    }

    CursorStylePlugin::CursorStylePlugin(
        std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> channel)
        : channel_(std::move(channel)) {}

    CursorStylePlugin::~CursorStylePlugin() {};

    void CursorStylePlugin::HandleMethodCall(
        const flutter::MethodCall<flutter::EncodableValue>& method_call,
        std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
        if (method_call.method_name().compare("setStyle") == 0) {
            ::SetCursor(LoadCursor(nullptr, IDC_HAND));
            result->Success();
        }
        else {
            result->NotImplemented();
        }
    }

}

void CursorStylePluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
    static auto* plugin_registrar = new flutter::PluginRegistrar(registrar);

    CursorStylePlugin::RegisterWithRegistrar(plugin_registrar);
}
