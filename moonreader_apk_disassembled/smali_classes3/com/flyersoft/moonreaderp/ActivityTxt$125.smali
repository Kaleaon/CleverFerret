.class Lcom/flyersoft/moonreaderp/ActivityTxt$125;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->createBookmark(Ljava/lang/String;ZZ)V
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

    .line 12965
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AfterEdit(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 12967
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateBookmark2(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 12968
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateForFitHardwareAccelerate(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 12969
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {p1}, Lcom/flyersoft/views/ContentLay;->postInvalidate()V

    :cond_0
    return-void
.end method
