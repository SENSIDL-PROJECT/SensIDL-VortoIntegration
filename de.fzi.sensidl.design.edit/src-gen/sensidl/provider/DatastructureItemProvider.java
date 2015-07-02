/**
 */
package sensidl.provider;


import java.util.Collection;
import java.util.List;
import org.eclipse.emf.common.notify.AdapterFactory;
import org.eclipse.emf.common.notify.Notification;
import org.eclipse.emf.ecore.EStructuralFeature;
import org.eclipse.emf.edit.provider.IItemPropertyDescriptor;
import org.eclipse.emf.edit.provider.ViewerNotification;
import sensidl.Datastructure;
import sensidl.SensidlFactory;
import sensidl.SensidlPackage;

/**
 * This is the item provider adapter for a {@link sensidl.Datastructure} object.
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @generated
 */
public class DatastructureItemProvider extends DatafieldItemProvider {
	/**
	 * This constructs an instance from a factory and a notifier.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public DatastructureItemProvider(AdapterFactory adapterFactory) {
		super(adapterFactory);
	}

	/**
	 * This returns the property descriptors for the adapted class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public List<IItemPropertyDescriptor> getPropertyDescriptors(Object object) {
		if (itemPropertyDescriptors == null) {
			super.getPropertyDescriptors(object);

		}
		return itemPropertyDescriptors;
	}

	/**
	 * This specifies how to implement {@link #getChildren} and is used to deduce an appropriate feature for an
	 * {@link org.eclipse.emf.edit.command.AddCommand}, {@link org.eclipse.emf.edit.command.RemoveCommand} or
	 * {@link org.eclipse.emf.edit.command.MoveCommand} in {@link #createCommand}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Collection<? extends EStructuralFeature> getChildrenFeatures(Object object) {
		if (childrenFeatures == null) {
			super.getChildrenFeatures(object);
			childrenFeatures.add(SensidlPackage.Literals.DATASTRUCTURE__DATAFIELDS);
		}
		return childrenFeatures;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EStructuralFeature getChildFeature(Object object, Object child) {
		// Check the type of the specified child object and return the proper feature to use for
		// adding (see {@link AddCommand}) it as a child.

		return super.getChildFeature(object, child);
	}

	/**
	 * This returns Datastructure.gif.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object getImage(Object object) {
		return overlayImage(object, getResourceLocator().getImage("full/obj16/Datastructure"));
	}

	/**
	 * This returns the label text for the adapted class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String getText(Object object) {
		String label = ((Datastructure)object).getName();
		return label == null || label.length() == 0 ?
			getString("_UI_Datastructure_type") :
			getString("_UI_Datastructure_type") + " " + label;
	}
	

	/**
	 * This handles model notifications by calling {@link #updateChildren} to update any cached
	 * children and by creating a viewer notification, which it passes to {@link #fireNotifyChanged}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void notifyChanged(Notification notification) {
		updateChildren(notification);

		switch (notification.getFeatureID(Datastructure.class)) {
			case SensidlPackage.DATASTRUCTURE__DATAFIELDS:
				fireNotifyChanged(new ViewerNotification(notification, notification.getNotifier(), true, false));
				return;
		}
		super.notifyChanged(notification);
	}

	/**
	 * This adds {@link org.eclipse.emf.edit.command.CommandParameter}s describing the children
	 * that can be created under this object.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected void collectNewChildDescriptors(Collection<Object> newChildDescriptors, Object object) {
		super.collectNewChildDescriptors(newChildDescriptors, object);

		newChildDescriptors.add
			(createChildParameter
				(SensidlPackage.Literals.DATASTRUCTURE__DATAFIELDS,
				 SensidlFactory.eINSTANCE.createCalculated()));

		newChildDescriptors.add
			(createChildParameter
				(SensidlPackage.Literals.DATASTRUCTURE__DATAFIELDS,
				 SensidlFactory.eINSTANCE.createConstantData()));

		newChildDescriptors.add
			(createChildParameter
				(SensidlPackage.Literals.DATASTRUCTURE__DATAFIELDS,
				 SensidlFactory.eINSTANCE.createMeasuredData()));

		newChildDescriptors.add
			(createChildParameter
				(SensidlPackage.Literals.DATASTRUCTURE__DATAFIELDS,
				 SensidlFactory.eINSTANCE.createDatastructure()));

		newChildDescriptors.add
			(createChildParameter
				(SensidlPackage.Literals.DATASTRUCTURE__DATAFIELDS,
				 SensidlFactory.eINSTANCE.createNonMeasuredData()));

		newChildDescriptors.add
			(createChildParameter
				(SensidlPackage.Literals.DATASTRUCTURE__DATAFIELDS,
				 SensidlFactory.eINSTANCE.createDeclaration()));

		newChildDescriptors.add
			(createChildParameter
				(SensidlPackage.Literals.DATASTRUCTURE__DATAFIELDS,
				 SensidlFactory.eINSTANCE.createDatastructureDeclaration()));
	}

}