package com.gms.gms.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ThesisHelp implements Serializable {
    private Teacher teacher;
    private List<Thesis> thesisList;
}
