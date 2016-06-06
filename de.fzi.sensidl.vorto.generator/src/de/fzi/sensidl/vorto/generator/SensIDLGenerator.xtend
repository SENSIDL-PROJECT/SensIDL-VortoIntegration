package de.fzi.sensidl.vorto.generator

import java.io.IOException
import org.eclipse.vorto.codegen.api.IMappingContext
import org.eclipse.vorto.codegen.api.IVortoCodeGenerator
import org.eclipse.vorto.core.api.model.informationmodel.InformationModel
import de.fzi.sensidl.language.generator.generationstep.skeletongenerationstep.SkeletonGenerationStep

/**
 * SensIDL Vorto Generator. The Vorto Information model will be 
 * transformed to a SensIDL model and code will be generated by 
 * the SensIDL generator
 * 
 * @author Sven Eckhardt
 */
class SensIDLGenerator implements IVortoCodeGenerator {
	/**
	 * Start the transformation from the vorto information model to 
	 * the sensidl model (which will start the sensidl generation process)
	 */
	override generate(InformationModel infomodel, IMappingContext mappingContext) {
		// execute the transformation handler
		SkeletonGenerationStep.createSidlFile = true;
		try {
			new TransformationHandler().execute(infomodel)
		} catch (IOException ex) {
			println(ex.getMessage())
		}
		// return null, this will produce a NullPointerException 
		// later on in the vorto generation process. This has no 
		// negative side effects, because the generation process 		
		// is controlled by the sensidl generator and not the vorto 
		// generation API.
		return null
	}

	override getServiceKey() {
		return "SensIDL Generator";
	}
}
