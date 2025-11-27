.class Lcom/flyersoft/moonreaderp/ActivityTxt$128;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/widget/RatingBar$OnRatingBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_book_info()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 13297
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$128;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$128;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRatingChanged(Landroid/widget/RatingBar;FZ)V
    .locals 4

    const/4 v0, 0x1

    .line 13300
    invoke-static {v0}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_1

    :cond_0
    if-eqz p3, :cond_6

    .line 13303
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v1, "rating: "

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 13304
    invoke-virtual {p1}, Landroid/widget/RatingBar;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Float;

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result p3

    const/high16 v0, 0x3f800000    # 1.0f

    rem-float v2, p2, v0

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    float-to-int p2, p2

    int-to-float p2, p2

    add-float/2addr p2, v0

    :cond_1
    cmpl-float p3, p3, p2

    if-nez p3, :cond_2

    const/4 p2, 0x0

    .line 13309
    :cond_2
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/RatingBar;->setTag(Ljava/lang/Object;)V

    .line 13310
    invoke-virtual {p1, p2}, Landroid/widget/RatingBar;->setRating(F)V

    .line 13312
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$128;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    if-eqz p1, :cond_4

    .line 13313
    const-string p1, ""

    cmpl-float p3, p2, v3

    if-nez p3, :cond_3

    goto :goto_0

    :cond_3
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    float-to-int p1, p2

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 13314
    :goto_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$128;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->rate:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_6

    .line 13315
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$128;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iput-object p1, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->rate:Ljava/lang/String;

    .line 13316
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$128;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {p1, v1}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 13317
    sget-object p1, Lcom/flyersoft/tools/A;->listShelfBookCaches:Ljava/util/HashMap;

    sget-object p2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    if-eqz p1, :cond_6

    .line 13319
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$128;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->rate:Ljava/lang/String;

    iput-object p2, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->rate:Ljava/lang/String;

    return-void

    .line 13322
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$128;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetinfo_dlg(Lcom/flyersoft/moonreaderp/ActivityTxt;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 13323
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$128;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetinfo_dlg(Lcom/flyersoft/moonreaderp/ActivityTxt;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    .line 13324
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$128;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    float-to-int p2, p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_add_favorite(I)V

    :cond_6
    :goto_1
    return-void
.end method
