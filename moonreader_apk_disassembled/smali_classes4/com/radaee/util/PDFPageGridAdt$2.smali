.class Lcom/radaee/util/PDFPageGridAdt$2;
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

    .line 243
    iput-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$2;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    iput-object p2, p0, Lcom/radaee/util/PDFPageGridAdt$2;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 246
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$2;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    invoke-static {p1}, Lcom/radaee/util/PDFPageGridAdt;->access$400(Lcom/radaee/util/PDFPageGridAdt;)[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    move-result-object p1

    array-length p1, p1

    const/4 v0, 0x2

    if-ge p1, v0, :cond_0

    return-void

    .line 250
    :cond_0
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$2;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_deleted:Z

    .line 251
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$2;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    invoke-static {p1}, Lcom/radaee/util/PDFPageGridAdt;->access$500(Lcom/radaee/util/PDFPageGridAdt;)Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    move-result-object p1

    iget-object v1, p0, Lcom/radaee/util/PDFPageGridAdt$2;->val$fitem:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    invoke-virtual {p1, v1}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->end_render(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;)V

    .line 252
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$2;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    invoke-static {p1, v0}, Lcom/radaee/util/PDFPageGridAdt;->access$302(Lcom/radaee/util/PDFPageGridAdt;Z)Z

    .line 253
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$2;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    invoke-static {p1}, Lcom/radaee/util/PDFPageGridAdt;->access$600(Lcom/radaee/util/PDFPageGridAdt;)V

    return-void
.end method
