.class Lcom/flyersoft/moonreaderp/ActivityTxt$191;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doOrientationLongTap(Landroid/view/View;)V
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

    .line 18514
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$191;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 3

    .line 18516
    sget v0, Lcom/flyersoft/tools/A;->screenState:I

    if-eq v0, p1, :cond_1

    if-nez p1, :cond_0

    .line 18517
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$191;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isAutoRotateScreen(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 18518
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$191;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$191;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->auto_sensor_failed_tip:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 18520
    :cond_0
    sput p1, Lcom/flyersoft/tools/A;->screenState:I

    .line 18521
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$191;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenOrientation()V

    :cond_1
    return-void
.end method
