class Trancations{
  String? id,txnId,responseCode,txnrefId,status,approvalRef;

  Trancations({
    this.id,
    this.txnId,
    this.responseCode,
    this.txnrefId,
    this.status,
    this.approvalRef,

  });
 Map<String, dynamic> toMap() {
    return {
      'id':id,
      'transactionId':txnId,
      'responseCode':responseCode,
      'transactionRefId': txnrefId,
      'status':status,
      'approvalRefNo':approvalRef,
     
    };
  }
   @override
  String toString() {
    return 'ApartmentDetails{id: $id, transactionId:$txnId,responseCode:$responseCode,transactionRefId: $txnrefId,status:$status,approvalRefNo:$approvalRef,}';                                     
  }


}

 // ignore: unnecessary_new
  Trancations newtxn= new Trancations(); 
  List<Trancations> txnList =[];
  