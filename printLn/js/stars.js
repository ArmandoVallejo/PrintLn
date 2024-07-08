$(document).ready(function() {
    $('.star-rating .bi').click(function() {

        var product = $(this).closest('.product-rating');

        var rating = $(this).data('rating');
        //$('#ratingValue').text('Rating: ' + rating);

        // Reset all stars
        //$('.star-rating .bi').removeClass('bi-star-fill').addClass('bi-star');
        //$(this).removeClass('bi-star-fill').addClass('bi-star');
        product.find('.star-rating .bi').removeClass('bi-star-fill').addClass('bi-star');

        // Highlight the selected stars
        $(this).prevAll().addBack().removeClass('bi-star').addClass('bi-star-fill');
    });
});