/**
 */
package sensidl.util;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.util.Switch;

import sensidl.*;

/**
 * <!-- begin-user-doc -->
 * The <b>Switch</b> for the model's inheritance hierarchy.
 * It supports the call {@link #doSwitch(EObject) doSwitch(object)}
 * to invoke the <code>caseXXX</code> method for each class of the model,
 * starting with the actual class of the object
 * and proceeding up the inheritance hierarchy
 * until a non-null result is returned,
 * which is the result of the switch.
 * <!-- end-user-doc -->
 * @see sensidl.SensidlPackage
 * @generated
 */
public class SensidlSwitch<T> extends Switch<T> {
	/**
	 * The cached model package
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static SensidlPackage modelPackage;

	/**
	 * Creates an instance of the switch.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public SensidlSwitch() {
		if (modelPackage == null) {
			modelPackage = SensidlPackage.eINSTANCE;
		}
	}

	/**
	 * Checks whether this is a switch for the given package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @parameter ePackage the package in question.
	 * @return whether this is a switch for the given package.
	 * @generated
	 */
	@Override
	protected boolean isSwitchFor(EPackage ePackage) {
		return ePackage == modelPackage;
	}

	/**
	 * Calls <code>caseXXX</code> for each class of the model until one returns a non null result; it yields that result.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the first non-null result returned by a <code>caseXXX</code> call.
	 * @generated
	 */
	@Override
	protected T doSwitch(int classifierID, EObject theEObject) {
		switch (classifierID) {
			case SensidlPackage.DATA_MODEL: {
				DataModel dataModel = (DataModel)theEObject;
				T result = caseDataModel(dataModel);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.REPRESENTATION: {
				Representation representation = (Representation)theEObject;
				T result = caseRepresentation(representation);
				if (result == null) result = caseNamedElement(representation);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.DATAFIELD: {
				Datafield datafield = (Datafield)theEObject;
				T result = caseDatafield(datafield);
				if (result == null) result = caseNamedElement(datafield);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.CALCULATED: {
				Calculated calculated = (Calculated)theEObject;
				T result = caseCalculated(calculated);
				if (result == null) result = caseDatafield(calculated);
				if (result == null) result = caseNamedElement(calculated);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.PARAMETER: {
				Parameter parameter = (Parameter)theEObject;
				T result = caseParameter(parameter);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.CONSTANT_DATA: {
				ConstantData constantData = (ConstantData)theEObject;
				T result = caseConstantData(constantData);
				if (result == null) result = caseDatafield(constantData);
				if (result == null) result = caseNamedElement(constantData);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.MEASURED_DATA: {
				MeasuredData measuredData = (MeasuredData)theEObject;
				T result = caseMeasuredData(measuredData);
				if (result == null) result = caseVariableData(measuredData);
				if (result == null) result = caseDatafield(measuredData);
				if (result == null) result = caseNamedElement(measuredData);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.DATASTRUCTURE: {
				Datastructure datastructure = (Datastructure)theEObject;
				T result = caseDatastructure(datastructure);
				if (result == null) result = caseDatafield(datastructure);
				if (result == null) result = caseNamedElement(datastructure);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.OPTIONS: {
				Options options = (Options)theEObject;
				T result = caseOptions(options);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.CONSTRAINT: {
				Constraint constraint = (Constraint)theEObject;
				T result = caseConstraint(constraint);
				if (result == null) result = caseNamedElement(constraint);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.DATA_CONSTRAINT: {
				DataConstraint dataConstraint = (DataConstraint)theEObject;
				T result = caseDataConstraint(dataConstraint);
				if (result == null) result = caseConstraint(dataConstraint);
				if (result == null) result = caseNamedElement(dataConstraint);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.DATA_RANGE: {
				DataRange dataRange = (DataRange)theEObject;
				T result = caseDataRange(dataRange);
				if (result == null) result = caseDataConstraint(dataRange);
				if (result == null) result = caseConstraint(dataRange);
				if (result == null) result = caseNamedElement(dataRange);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.BOUND: {
				Bound bound = (Bound)theEObject;
				T result = caseBound(bound);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.DATA_ADAPTION: {
				DataAdaption dataAdaption = (DataAdaption)theEObject;
				T result = caseDataAdaption(dataAdaption);
				if (result == null) result = caseDataConstraint(dataAdaption);
				if (result == null) result = caseConstraint(dataAdaption);
				if (result == null) result = caseNamedElement(dataAdaption);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.NAMED_ELEMENT: {
				NamedElement namedElement = (NamedElement)theEObject;
				T result = caseNamedElement(namedElement);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.VARIABLE_DATA: {
				VariableData variableData = (VariableData)theEObject;
				T result = caseVariableData(variableData);
				if (result == null) result = caseDatafield(variableData);
				if (result == null) result = caseNamedElement(variableData);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.NON_MEASURED_DATA: {
				NonMeasuredData nonMeasuredData = (NonMeasuredData)theEObject;
				T result = caseNonMeasuredData(nonMeasuredData);
				if (result == null) result = caseVariableData(nonMeasuredData);
				if (result == null) result = caseDatafield(nonMeasuredData);
				if (result == null) result = caseNamedElement(nonMeasuredData);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.DATASTRUCTURE_DECLARATION: {
				DatastructureDeclaration datastructureDeclaration = (DatastructureDeclaration)theEObject;
				T result = caseDatastructureDeclaration(datastructureDeclaration);
				if (result == null) result = caseDeclaration(datastructureDeclaration);
				if (result == null) result = caseDatafield(datastructureDeclaration);
				if (result == null) result = caseNamedElement(datastructureDeclaration);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case SensidlPackage.DECLARATION: {
				Declaration declaration = (Declaration)theEObject;
				T result = caseDeclaration(declaration);
				if (result == null) result = caseDatafield(declaration);
				if (result == null) result = caseNamedElement(declaration);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			default: return defaultCase(theEObject);
		}
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Data Model</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Data Model</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseDataModel(DataModel object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Representation</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Representation</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseRepresentation(Representation object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Datafield</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Datafield</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseDatafield(Datafield object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Calculated</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Calculated</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseCalculated(Calculated object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Parameter</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Parameter</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseParameter(Parameter object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Constant Data</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Constant Data</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseConstantData(ConstantData object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Measured Data</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Measured Data</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseMeasuredData(MeasuredData object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Datastructure</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Datastructure</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseDatastructure(Datastructure object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Options</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Options</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseOptions(Options object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Constraint</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Constraint</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseConstraint(Constraint object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Data Constraint</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Data Constraint</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseDataConstraint(DataConstraint object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Data Range</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Data Range</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseDataRange(DataRange object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Bound</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Bound</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseBound(Bound object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Data Adaption</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Data Adaption</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseDataAdaption(DataAdaption object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Named Element</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Named Element</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseNamedElement(NamedElement object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Variable Data</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Variable Data</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseVariableData(VariableData object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Non Measured Data</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Non Measured Data</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseNonMeasuredData(NonMeasuredData object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Datastructure Declaration</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Datastructure Declaration</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseDatastructureDeclaration(DatastructureDeclaration object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Declaration</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Declaration</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseDeclaration(Declaration object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>EObject</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch, but this is the last case anyway.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>EObject</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject)
	 * @generated
	 */
	@Override
	public T defaultCase(EObject object) {
		return null;
	}

} //SensidlSwitch