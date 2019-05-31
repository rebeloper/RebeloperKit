//
//  RKListController.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 31/05/2019.
//

import UIKit

/**
 Convenient list component where a Header class is not required.
 
 ## Generics ##
 T: the cell type that this list will register and dequeue.
 
 U: the item type that each cell will visually represent.
 */

open class RKListController<T: RKListCell<U>, U>: RKListHeaderController<T, U, UICollectionReusableView> {
}

