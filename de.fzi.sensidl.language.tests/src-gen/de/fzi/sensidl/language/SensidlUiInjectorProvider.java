/*
* generated by Xtext
*/
package de.fzi.sensidl.language;

import org.eclipse.xtext.junit4.IInjectorProvider;

import com.google.inject.Injector;

public class SensidlUiInjectorProvider implements IInjectorProvider {
	
	public Injector getInjector() {
		return de.fzi.sensidl.language.ui.internal.SensidlActivator.getInstance().getInjector("de.fzi.sensidl.language.Sensidl");
	}
	
}
