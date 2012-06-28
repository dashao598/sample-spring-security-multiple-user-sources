// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.example.model.security;

import com.example.model.security.Principal;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Principal_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Principal.entityManager;
    
    public static final EntityManager Principal.entityManager() {
        EntityManager em = new Principal().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Principal.countPrincipals() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Principal o", Long.class).getSingleResult();
    }
    
    public static List<Principal> Principal.findAllPrincipals() {
        return entityManager().createQuery("SELECT o FROM Principal o", Principal.class).getResultList();
    }
    
    public static Principal Principal.findPrincipal(Long id) {
        if (id == null) return null;
        return entityManager().find(Principal.class, id);
    }
    
    public static List<Principal> Principal.findPrincipalEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Principal o", Principal.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Principal.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Principal.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Principal attached = Principal.findPrincipal(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Principal.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Principal.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Principal Principal.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Principal merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
