package com.gms.gms.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TeacherTeamHelp {
    private Integer teacherId,teamId;
    private boolean isLeader;
}
