// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.example.model.security;

import com.example.model.security.Authority;
import com.example.model.security.AuthorityDataOnDemand;
import com.example.model.security.AuthorityIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AuthorityIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AuthorityIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AuthorityIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AuthorityIntegrationTest: @Transactional;
    
    @Autowired
    private AuthorityDataOnDemand AuthorityIntegrationTest.dod;
    
    @Test
    public void AuthorityIntegrationTest.testCountAuthoritys() {
        Assert.assertNotNull("Data on demand for 'Authority' failed to initialize correctly", dod.getRandomAuthority());
        long count = Authority.countAuthoritys();
        Assert.assertTrue("Counter for 'Authority' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AuthorityIntegrationTest.testFindAuthority() {
        Authority obj = dod.getRandomAuthority();
        Assert.assertNotNull("Data on demand for 'Authority' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Authority' failed to provide an identifier", id);
        obj = Authority.findAuthority(id);
        Assert.assertNotNull("Find method for 'Authority' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Authority' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AuthorityIntegrationTest.testFindAllAuthoritys() {
        Assert.assertNotNull("Data on demand for 'Authority' failed to initialize correctly", dod.getRandomAuthority());
        long count = Authority.countAuthoritys();
        Assert.assertTrue("Too expensive to perform a find all test for 'Authority', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Authority> result = Authority.findAllAuthoritys();
        Assert.assertNotNull("Find all method for 'Authority' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Authority' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AuthorityIntegrationTest.testFindAuthorityEntries() {
        Assert.assertNotNull("Data on demand for 'Authority' failed to initialize correctly", dod.getRandomAuthority());
        long count = Authority.countAuthoritys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Authority> result = Authority.findAuthorityEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Authority' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Authority' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AuthorityIntegrationTest.testFlush() {
        Authority obj = dod.getRandomAuthority();
        Assert.assertNotNull("Data on demand for 'Authority' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Authority' failed to provide an identifier", id);
        obj = Authority.findAuthority(id);
        Assert.assertNotNull("Find method for 'Authority' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAuthority(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Authority' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AuthorityIntegrationTest.testMergeUpdate() {
        Authority obj = dod.getRandomAuthority();
        Assert.assertNotNull("Data on demand for 'Authority' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Authority' failed to provide an identifier", id);
        obj = Authority.findAuthority(id);
        boolean modified =  dod.modifyAuthority(obj);
        Integer currentVersion = obj.getVersion();
        Authority merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Authority' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AuthorityIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Authority' failed to initialize correctly", dod.getRandomAuthority());
        Authority obj = dod.getNewTransientAuthority(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Authority' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Authority' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Authority' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AuthorityIntegrationTest.testRemove() {
        Authority obj = dod.getRandomAuthority();
        Assert.assertNotNull("Data on demand for 'Authority' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Authority' failed to provide an identifier", id);
        obj = Authority.findAuthority(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Authority' with identifier '" + id + "'", Authority.findAuthority(id));
    }
    
}
