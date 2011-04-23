/*
 ************************************************************************************
 * Copyright (C) 2001-2010 encuestame: system online surveys Copyright (C) 2010
 * encuestame Development Team.
 * Licensed under the Apache Software License version 2.0
 * You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to  in writing,  software  distributed
 * under the License is distributed  on  an  "AS IS"  BASIS,  WITHOUT  WARRANTIES  OR
 * CONDITIONS OF ANY KIND, either  express  or  implied.  See  the  License  for  the
 * specific language governing permissions and limitations under the License.
 ************************************************************************************
 */

package org.encuestame.business.service.imp;

import java.io.IOException;

import org.apache.commons.httpclient.HttpException;
import org.encuestame.core.service.ServiceOperations;
import org.encuestame.persistence.domain.security.SocialAccount;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.http.AccessToken;
import twitter4j.http.RequestToken;

/**
 * Twitter Service Interface.
 * @author Picado, Juan juan@encuestame.org
 * @since Feb 13, 2010 4:07:14 PM
 * @version $Id$
 */
public interface TwitterAPIOperations{

    /**
     * Get Twitter Ping.
     * @param consumerKey consumer key
     * @param consumerSecret consumer secret
     * @return {@link RequestToken}
     * @throws TwitterException exception
     */
    RequestToken getTwitterPing(String consumerKey, String consumerSecret)
            throws TwitterException;

    /**
     * OAuth Public Tweet.
     * @param socialAccount
     * @param tweet
     * @return
     * @throws TwitterException
     */
    Status updateStatus(final SocialAccount socialAccount, final String tweet) throws TwitterException;
}
