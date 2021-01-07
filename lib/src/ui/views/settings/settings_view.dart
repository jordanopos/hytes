import 'package:flutter/material.dart';
	import 'package:stacked/stacked.dart';
	import './settings_viewmodel.dart';
    
    class SettingsView extends StatelessWidget {
		@override
		Widget build(BuildContext context) {
			return ViewModelBuilder<SettingsViewModel>.reactive(
			builder: (context, model, child) => Scaffold(),
			viewModelBuilder: () => SettingsViewModel(),
			);
		}
	}