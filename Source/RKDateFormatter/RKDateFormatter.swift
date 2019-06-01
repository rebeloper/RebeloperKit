//
//  RKDateFormatter.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import Foundation

public enum RKDateFormatter: String {
    case MMM_d = "MMM d"
    case EEEE_MMM_d_yyyy = "EEEE, MMM d, yyyy"
    case MM_dd_yyyy = "MM/dd/yyyy"
    case MM_dd_yyyy_HH_mm = "MM-dd-yyyy HH:mm"
    case MMM_d_h_mm_a = "MMM d, h:mm a"
    case MMMM_yyyy = "MMMM yyyy"
    case yyyy_MM_dd_T_HH_mm_ssZ = "yyyy-MM-dd'T'HH:mm:ssZ"
    case dd_MM_yy = "dd.MM.yy"
    case HH_mm_ss_SSS = "HH:mm:ss.SSS"
    case MM_dd_yyyy_HH_mm_ss_SSS = "MM/dd/yyyy HH:mm:ss:SSS"
    case MM_dd_yyyy_HH_mm_ss = "MM-dd-yyyy HH:mm:ss"
    case E_d_MMM_yyyy_HH_mm_ss_Z = "E, d MMM yyyy HH:mm:ss Z"
    case MMM_d_HH_mm_ss_SSSZ = "MMM d, HH:mm:ss:SSSZ"
}
