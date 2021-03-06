// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.example.model.security;

import com.example.model.security.Authority;
import com.example.model.security.AuthorityDataOnDemand;
import com.example.model.security.AuthorityPrincipalAssignment;
import com.example.model.security.AuthorityPrincipalAssignmentDataOnDemand;
import com.example.model.security.Principal;
import com.example.model.security.PrincipalDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect AuthorityPrincipalAssignmentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AuthorityPrincipalAssignmentDataOnDemand: @Component;
    
    private Random AuthorityPrincipalAssignmentDataOnDemand.rnd = new SecureRandom();
    
    private List<AuthorityPrincipalAssignment> AuthorityPrincipalAssignmentDataOnDemand.data;
    
    @Autowired
    private AuthorityDataOnDemand AuthorityPrincipalAssignmentDataOnDemand.authorityDataOnDemand;
    
    @Autowired
    private PrincipalDataOnDemand AuthorityPrincipalAssignmentDataOnDemand.principalDataOnDemand;
    
    public AuthorityPrincipalAssignment AuthorityPrincipalAssignmentDataOnDemand.getNewTransientAuthorityPrincipalAssignment(int index) {
        AuthorityPrincipalAssignment obj = new AuthorityPrincipalAssignment();
        setRoleId(obj, index);
        setUsername(obj, index);
        return obj;
    }
    
    public void AuthorityPrincipalAssignmentDataOnDemand.setRoleId(AuthorityPrincipalAssignment obj, int index) {
        Authority roleId = authorityDataOnDemand.getRandomAuthority();
        obj.setRoleId(roleId);
    }
    
    public void AuthorityPrincipalAssignmentDataOnDemand.setUsername(AuthorityPrincipalAssignment obj, int index) {
        Principal username = principalDataOnDemand.getRandomPrincipal();
        obj.setUsername(username);
    }
    
    public AuthorityPrincipalAssignment AuthorityPrincipalAssignmentDataOnDemand.getSpecificAuthorityPrincipalAssignment(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AuthorityPrincipalAssignment obj = data.get(index);
        Long id = obj.getId();
        return AuthorityPrincipalAssignment.findAuthorityPrincipalAssignment(id);
    }
    
    public AuthorityPrincipalAssignment AuthorityPrincipalAssignmentDataOnDemand.getRandomAuthorityPrincipalAssignment() {
        init();
        AuthorityPrincipalAssignment obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return AuthorityPrincipalAssignment.findAuthorityPrincipalAssignment(id);
    }
    
    public boolean AuthorityPrincipalAssignmentDataOnDemand.modifyAuthorityPrincipalAssignment(AuthorityPrincipalAssignment obj) {
        return false;
    }
    
    public void AuthorityPrincipalAssignmentDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = AuthorityPrincipalAssignment.findAuthorityPrincipalAssignmentEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AuthorityPrincipalAssignment' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AuthorityPrincipalAssignment>();
        for (int i = 0; i < 10; i++) {
            AuthorityPrincipalAssignment obj = getNewTransientAuthorityPrincipalAssignment(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
