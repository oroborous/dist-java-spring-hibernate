package edu.wctc.service;

import edu.wctc.entity.Donut;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface DonutService {
    void deleteDonut(int theId);

    Donut getDonut(int theId);

    Donut getDonutAndReviews(int donutId);

    List<Donut> getDonuts();

    List<Donut> getDonutsByName(String theSearchTerm);

    void saveDonut(Donut theDonut, int imageId);

}
