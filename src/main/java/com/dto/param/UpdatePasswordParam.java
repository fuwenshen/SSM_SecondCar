package com.dto.param;

import lombok.Data;

/**
 * Created by FWS on 2018/5/9.
 */
@Data
public class UpdatePasswordParam {
    String id;
    String oldPassword;
    String newPassword;
}
