.class Lcom/flyersoft/moonreaderp/ActivityTxt$14;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/A$AfterFlipCurl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->hide_ebook_cover()Z
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

    .line 1726
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$14;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public Finished(Z)V
    .locals 0

    .line 1729
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$14;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mneedPreCurl(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1730
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$14;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$minit3dHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :cond_0
    return-void
.end method
