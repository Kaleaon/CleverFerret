.class Lcom/radaee/util/PDFPageGridAdt$1;
.super Ljava/lang/Object;
.source "PDFPageGridAdt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field final synthetic val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;


# direct methods
.method constructor <init>(Lcom/radaee/util/PDFPageGridAdt;Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;)V
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

    .line 229
    iput-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$1;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    iput-object p2, p0, Lcom/radaee/util/PDFPageGridAdt$1;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 232
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$1;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iget v0, p1, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate:I

    add-int/lit8 v0, v0, 0x5a

    iput v0, p1, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate:I

    .line 233
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$1;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iget v0, p1, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate:I

    rem-int/lit16 v0, v0, 0x168

    iput v0, p1, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate:I

    .line 234
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$1;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iget p1, p1, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate:I

    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$1;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iget v0, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate_org:I

    sub-int/2addr p1, v0

    if-gez p1, :cond_0

    add-int/lit16 p1, p1, 0x168

    .line 236
    :cond_0
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$1;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iget-object v0, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_img:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/radaee/util/PDFPageGridAdt$1;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iget-object v1, v1, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_img:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setPivotX(F)V

    .line 237
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$1;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iget-object v0, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_img:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/radaee/util/PDFPageGridAdt$1;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iget-object v1, v1, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_img:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setPivotY(F)V

    .line 238
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$1;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iget-object v0, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_img:Landroid/widget/ImageView;

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setRotation(F)V

    .line 239
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$1;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/radaee/util/PDFPageGridAdt;->access$302(Lcom/radaee/util/PDFPageGridAdt;Z)Z

    return-void
.end method
