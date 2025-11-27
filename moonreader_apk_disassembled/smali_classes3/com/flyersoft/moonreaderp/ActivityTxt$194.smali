.class Lcom/flyersoft/moonreaderp/ActivityTxt$194;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfInitLay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 18598
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$194;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 18600
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$194;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->inverseLayoutVisible(Z)V

    .line 18601
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$194;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_show_chapters(I)V

    return-void
.end method
