package edu.wctc.dao;

import edu.wctc.entity.Donut;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DonutDAOImpl implements DonutDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Donut> getDonuts() {
        // Get current Hibernate session
        Session session = sessionFactory.getCurrentSession();

        // Get list of donuts from query
        List<Donut> donutList = session.createQuery("from Donut", Donut.class).getResultList();

        // Return results
        return donutList;
    }

    @Override
    public void saveDonut(Donut theDonut) {
        // Get current Hibernate session
        Session session = sessionFactory.getCurrentSession();

        // save/update the donut
        session.saveOrUpdate(theDonut);
    }

    @Override
    public Donut getDonut(int theId) {
        // Get current Hibernate session
        Session session = sessionFactory.getCurrentSession();

        return session.get(Donut.class, theId);
    }

    @Override
    public void deleteDonut(int theId) {
        // Get current Hibernate session
        Session session = sessionFactory.getCurrentSession();

        // Select the object to get a persistent copy
        Donut doomedDonut = session.get(Donut.class, theId);

        // Only delete if ID was valid
        if (doomedDonut != null) {
            // Deleting this way will properly cascade deletes
            // and associated objects (like DonutReviews) will
            // also be deleted
            session.delete(doomedDonut);
        }
    }

    @Override
    public List<Donut> getDonutsByName(String theSearchTerm) {
        // Get current Hibernate session
        Session session = sessionFactory.getCurrentSession();

        // Add wildcards and make search term lowercase (for case insensitivity)
        theSearchTerm = "%" + theSearchTerm.toLowerCase() + "%";

        Query<Donut> query = session.createQuery("from Donut where lower(name) like :nameToSearch");
        query.setParameter("nameToSearch", theSearchTerm);

        return query.getResultList();
    }
}
