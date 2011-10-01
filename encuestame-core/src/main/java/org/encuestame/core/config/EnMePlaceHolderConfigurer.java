/*
 ************************************************************************************
 * Copyright (C) 2001-2011 encuestame: system online surveys Copyright (C) 2011
 * encuestame Development Team.
 * Licensed under the Apache Software License version 2.0
 * You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to  in writing,  software  distributed
 * under the License is distributed  on  an  "AS IS"  BASIS,  WITHOUT  WARRANTIES  OR
 * CONDITIONS OF ANY KIND, either  express  or  implied.  See  the  License  for  the
 * specific language governing permissions and limitations under the License.
 ************************************************************************************
 */
package org.encuestame.core.config;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * Extend {@link PropertyPlaceholderConfigurer}
 * @author Picado, Juan juanATencuestame.org
 * @since Mar 17, 2011
 */
public class EnMePlaceHolderConfigurer extends PropertyPlaceholderConfigurer {

    /**
     * JVM encuestame path param.
     */
    private static String overwriteJvmParam = "encuestame.custom.config";

    /**
     *
     */
    private static XMLConfigurationFileSupport configurationManager;


    /**
     * List of Properties.
     */
    private static Map<String, String> propertiesMap = new HashMap<String, String>();

    /**
     * Log.
     */
    private static Log log = LogFactory.getLog(EnMePlaceHolderConfigurer.class);

    /**
     * Process collection of properties.
     */
    @SuppressWarnings("deprecation")
    @Override
    protected void processProperties(
            ConfigurableListableBeanFactory beanFactory, Properties props)
            throws BeansException {
        try {
            EnMePlaceHolderConfigurer.configurationManager = new XMLConfigurationFileSupport();
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        //get form system property enviroment out file path.
        final String enviromentPropertyFile = System.getProperty(overwriteJvmParam);
        File customEncuestameFile;
        if(enviromentPropertyFile != null && enviromentPropertyFile.length() > 0) {
            customEncuestameFile = new File(enviromentPropertyFile);
            // make sure the file exists, then try and load it
            if(customEncuestameFile != null && customEncuestameFile.exists()) {
                InputStream is = null;
                try {
                    //trying to load custom file.
                    is = new FileInputStream(customEncuestameFile);
                } catch (FileNotFoundException e) {
                    log.error("Encuestame JVM Config file: File not Found from "+
                            customEncuestameFile.getAbsolutePath());
                }
                try {
                    //cool, if we can load all properties on the parent list.
                    props.load(is);
                } catch (IOException e) {
                    log.error("Encuestame JVM Config file: I/O Error, Permission Error? Check your path. "+
                            customEncuestameFile.getAbsolutePath());
                }
                log.info("Encuestame JVM Config file: Successfully loaded custom properties from "+
                        customEncuestameFile.getAbsolutePath());
            } else {
                log.info("Encuestame JVM Config file: Failed to load custom properties from "+
                        customEncuestameFile.getAbsolutePath());
            }
        }
        super.processProperties(beanFactory, props);
        propertiesMap = new HashMap<String, String>();
        for (Object key : props.keySet()) {
            String keyStr = key.toString();
            log.debug("Property--->"+keyStr+ " value="+props.getProperty(keyStr));
            propertiesMap.put(
                    keyStr,
                    parseStringValue(props.getProperty(keyStr), props,
                            new HashSet()));
        }
    }

    /**
     * Get property.
     * @param name property key
     * @return property value.
     */
    public static String getProperty(final String name) {
        return propertiesMap.get(name);
    }

    /**
     * The xml configuration manager.
     * @return
     */
    public static XMLConfigurationFileSupport getConfigurationManager() {
        //log.debug("getConfigurationManager() "+configurationManager.getXmlConfiguration().getFile().getAbsolutePath());
        return configurationManager;
    }

    /**
     * Return int param of {@link XMLConfigurationFileSupport}.
     * @param param
     * @return
     */
    public static Integer getParamConfigurationManager(final String param){
        return configurationManager.getIntProperty(param);
    }

    /**
    * Return string param of {@link XMLConfigurationFileSupport}.
    * @param param
    * @return
    */
   public static String getStringParamConfigurationManager(final String param){
       return configurationManager.getProperty(param);
   }

   //TODO: boolean param on configuration Manager.

    /**
     * Get boolean property.
     * @param property
     * @return
     */
    public static Boolean getBooleanProperty(final String property){
        String value = EnMePlaceHolderConfigurer.getProperty(property);
        if(value == null){
            value = "false";
        }
        return new Boolean(value);
    }

    /**
     * Get integer property.
     * @param property
     * @return
     */
    public static Integer getIntegerProperty(final String property){
        String value = EnMePlaceHolderConfigurer.getProperty(property);
        return new Integer(value);
    }
}
