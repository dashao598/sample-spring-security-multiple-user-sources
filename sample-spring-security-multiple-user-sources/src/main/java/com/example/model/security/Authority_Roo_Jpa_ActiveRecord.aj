// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.example.model.security;

import com.example.model.security.Authority;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Authority_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Authority.entityManager;
    
    public static final EntityManager Authority.entityManager() {
        EntityManager em = new Authority().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Authority.countAuthoritys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Authority o", Long.class).getSingleResult();
    }
    
    public static List<Authority> Authority.findAllAuthoritys() {
        return entityManager().createQuery("SELECT o FROM Authority o", Authority.class).getResultList();
    }
    
    public static Authority Authority.findAuthority(Long id) {
        if (id == null) return null;
        return entityManager().find(Authority.class, id);
    }
    
    public static List<Authority> Authority.findAuthorityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Authority o", Authority.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Authority.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Authority.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Authority attached = Authority.findAuthority(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Authority.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Authority.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Authority Authority.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Authority merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
