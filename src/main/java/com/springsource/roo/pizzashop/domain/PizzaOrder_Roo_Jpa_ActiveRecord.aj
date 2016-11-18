// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.pizzashop.domain;

import com.springsource.roo.pizzashop.domain.PizzaOrder;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PizzaOrder_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PizzaOrder.entityManager;
    
    public static final List<String> PizzaOrder.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "address", "total", "deliveryDate", "pizzas");
    
    public static final EntityManager PizzaOrder.entityManager() {
        EntityManager em = new PizzaOrder().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PizzaOrder.countPizzaOrders() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PizzaOrder o", Long.class).getSingleResult();
    }
    
    public static List<PizzaOrder> PizzaOrder.findAllPizzaOrders() {
        return entityManager().createQuery("SELECT o FROM PizzaOrder o", PizzaOrder.class).getResultList();
    }
    
    public static List<PizzaOrder> PizzaOrder.findAllPizzaOrders(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PizzaOrder o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PizzaOrder.class).getResultList();
    }
    
    public static PizzaOrder PizzaOrder.findPizzaOrder(Long id) {
        if (id == null) return null;
        return entityManager().find(PizzaOrder.class, id);
    }
    
    public static List<PizzaOrder> PizzaOrder.findPizzaOrderEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PizzaOrder o", PizzaOrder.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<PizzaOrder> PizzaOrder.findPizzaOrderEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PizzaOrder o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PizzaOrder.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PizzaOrder.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PizzaOrder.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PizzaOrder attached = PizzaOrder.findPizzaOrder(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PizzaOrder.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PizzaOrder.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PizzaOrder PizzaOrder.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PizzaOrder merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
