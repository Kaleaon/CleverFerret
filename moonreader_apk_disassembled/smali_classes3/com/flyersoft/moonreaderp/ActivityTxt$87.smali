.class Lcom/flyersoft/moonreaderp/ActivityTxt$87;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->navigateBackLinks()Z
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

    .line 10072
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    .line 10074
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetlink_backs(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    if-ne p1, v0, :cond_0

    .line 10075
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoFinish(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 10077
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetlink_backs(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 10078
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetlink_backs(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;

    .line 10079
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLinkBackInfo(Z)Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;

    .line 10080
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideLinkBackButton()V

    .line 10081
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgoToBackLink(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;)V

    :cond_1
    return-void
.end method
