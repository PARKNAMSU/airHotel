package kg.air.cnc.dao.payment;


import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.ReservationVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("PaymentDAO")
public class PaymentDAOImpl implements PaymentDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public CustomerVO getCustomerInfo(String customer_id) {
        CustomerVO customerVO = sqlSession.selectOne("kg.air.cnc.dao.payment.PaymentDAO.getCustomerInfo", customer_id);
        return customerVO;
    }

    @Override
    public void insertReservation(ReservationVO reservationVO) {
        sqlSession.insert("kg.air.cnc.dao.payment.PaymentDAO.insertReservation", reservationVO);
    }
}
