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

package org.encuestame.core.persistence.dao.imp;

import java.util.List;

import org.encuestame.core.persistence.dao.TweetPollDao;
import org.encuestame.core.persistence.pojo.TweetPoll;
import org.hibernate.HibernateException;

/**
 * Interface to {@link TweetPollDao}.
 * @author Picado, Juan juan@encuestame.org
 * @since Feb 17, 2010 8:27:20 PM
 * @version $Id: change to one dolar simbol
 */

public interface ITweetPoll extends IBaseDao{

    /**
     * Get TweetPoll by Id.
     * @param tweetPollId tweetPollId
     * @return {@link TweetPoll}
     * @throws HibernateException exception
     */
    TweetPoll getTweetPollById(final Long tweetPollId) throws HibernateException;

    /**
     * Retrieve Tweets Poll by User Id.
     * @param userId userId
     * @return list of tweet pools.
     */
     List<TweetPoll> retrieveTweetsByUserId(final Long userId);

}