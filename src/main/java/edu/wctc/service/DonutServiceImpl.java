package edu.wctc.service;

import edu.wctc.dao.DonutDAO;
import edu.wctc.dao.ImageDAO;
import edu.wctc.entity.Donut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
public class DonutServiceImpl implements DonutService {
    // inject Donut DAO
    @Autowired
    private DonutDAO donutDAO;

    // inject image saving service
    @Autowired
    private ImageDAO imageDAO;

    @Override
    @Transactional
    public void deleteDonut(int theId) {
        donutDAO.deleteDonut(theId);
    }

    @Override
    @Transactional
    public Donut getDonut(int theId) {
        return donutDAO.getDonut(theId);
    }

    @Override
    public Donut getDonutAndReviews(int donutId) {
        Donut aDonut = donutDAO.getDonut(donutId);

        // Touch the first review to load the list
        if (!aDonut.getReviews().isEmpty()) {
            // Use the get method to force dependent objects to load
            // Must be done while session is open
            aDonut.getReviews().get(0);
        }

        return aDonut;
    }

    @Override
    // with @Transactional annotation, no need to begin or commit transaction
    @Transactional
    public List<Donut> getDonuts() {
        // Delegate call to DAO
        return donutDAO.getDonuts();
    }

    @Override
    @Transactional
    public List<Donut> getDonutsByName(String theSearchTerm) {
        return donutDAO.getDonutsByName(theSearchTerm);
    }

    @Override
    @Transactional
    public void saveDonut(Donut theDonut, int imageId) {
        if (theDonut.getDateAdded() == null)
            theDonut.setDateAdded(LocalDate.now());

        if (imageId != -1) {
            theDonut.setImageId(imageId);
        }

        // Delegate call to DAO
        donutDAO.saveDonut(theDonut);
    }
}
