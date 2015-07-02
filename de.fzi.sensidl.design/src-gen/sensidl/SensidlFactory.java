/**
 */
package sensidl;

import org.eclipse.emf.ecore.EFactory;

/**
 * <!-- begin-user-doc -->
 * The <b>Factory</b> for the model.
 * It provides a create method for each non-abstract class of the model.
 * <!-- end-user-doc -->
 * @see sensidl.SensidlPackage
 * @generated
 */
public interface SensidlFactory extends EFactory {
	/**
	 * The singleton instance of the factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	SensidlFactory eINSTANCE = sensidl.impl.SensidlFactoryImpl.init();

	/**
	 * Returns a new object of class '<em>Data Model</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Data Model</em>'.
	 * @generated
	 */
	DataModel createDataModel();

	/**
	 * Returns a new object of class '<em>Representation</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Representation</em>'.
	 * @generated
	 */
	Representation createRepresentation();

	/**
	 * Returns a new object of class '<em>Calculated</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Calculated</em>'.
	 * @generated
	 */
	Calculated createCalculated();

	/**
	 * Returns a new object of class '<em>Parameter</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Parameter</em>'.
	 * @generated
	 */
	Parameter createParameter();

	/**
	 * Returns a new object of class '<em>Constant Data</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Constant Data</em>'.
	 * @generated
	 */
	ConstantData createConstantData();

	/**
	 * Returns a new object of class '<em>Measured Data</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Measured Data</em>'.
	 * @generated
	 */
	MeasuredData createMeasuredData();

	/**
	 * Returns a new object of class '<em>Datastructure</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Datastructure</em>'.
	 * @generated
	 */
	Datastructure createDatastructure();

	/**
	 * Returns a new object of class '<em>Options</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Options</em>'.
	 * @generated
	 */
	Options createOptions();

	/**
	 * Returns a new object of class '<em>Data Range</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Data Range</em>'.
	 * @generated
	 */
	DataRange createDataRange();

	/**
	 * Returns a new object of class '<em>Bound</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Bound</em>'.
	 * @generated
	 */
	Bound createBound();

	/**
	 * Returns a new object of class '<em>Data Adaption</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Data Adaption</em>'.
	 * @generated
	 */
	DataAdaption createDataAdaption();

	/**
	 * Returns a new object of class '<em>Non Measured Data</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Non Measured Data</em>'.
	 * @generated
	 */
	NonMeasuredData createNonMeasuredData();

	/**
	 * Returns a new object of class '<em>Datastructure Declaration</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Datastructure Declaration</em>'.
	 * @generated
	 */
	DatastructureDeclaration createDatastructureDeclaration();

	/**
	 * Returns a new object of class '<em>Declaration</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Declaration</em>'.
	 * @generated
	 */
	Declaration createDeclaration();

	/**
	 * Returns the package supported by this factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the package supported by this factory.
	 * @generated
	 */
	SensidlPackage getSensidlPackage();

} //SensidlFactory