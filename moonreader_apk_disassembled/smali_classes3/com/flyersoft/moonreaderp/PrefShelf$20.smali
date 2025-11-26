.class Lcom/flyersoft/moonreaderp/PrefShelf$20;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 831
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 834
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    iput p1, v0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    .line 835
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyDaySelected:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 836
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    sput p1, Lcom/flyersoft/tools/A;->woodyResDay:I

    goto :goto_0

    .line 838
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    sput p1, Lcom/flyersoft/tools/A;->woodyResNight:I

    .line 839
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$msetWoodySelect(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    .line 841
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    const/4 v0, 0x5

    if-ne p1, v0, :cond_1

    .line 842
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mgetCustSelfFile(Lcom/flyersoft/moonreaderp/PrefShelf;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShelf$20$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$20$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$20;)V

    const/4 v2, 0x0

    invoke-static {p1, v0, v2, v1}, Lcom/flyersoft/moonreaderp/SelectImageAct;->selectImage(Landroid/content/Context;Ljava/lang/String;ZLcom/flyersoft/tools/T$FileResultOK;)V

    :cond_1
    return-void
.end method
