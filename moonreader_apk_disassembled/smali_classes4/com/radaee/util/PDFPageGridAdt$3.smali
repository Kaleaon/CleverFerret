.class Lcom/radaee/util/PDFPageGridAdt$3;
.super Landroid/os/Handler;
.source "PDFPageGridAdt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/util/PDFPageGridAdt;-><init>(Landroid/content/Context;Lcom/radaee/pdf/Document;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/util/PDFPageGridAdt;


# direct methods
.method constructor <init>(Lcom/radaee/util/PDFPageGridAdt;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 257
    iput-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$3;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 260
    :cond_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    .line 261
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    const/4 p1, 0x0

    .line 263
    iput-object p1, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_bmp:Landroid/graphics/Bitmap;

    const/4 p1, 0x0

    .line 264
    iput p1, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_status:I

    .line 266
    :cond_1
    iget-object p1, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_img:Landroid/widget/ImageView;

    iget-object v0, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method
