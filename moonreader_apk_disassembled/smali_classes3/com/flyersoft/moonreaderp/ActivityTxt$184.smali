.class Lcom/flyersoft/moonreaderp/ActivityTxt$184;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doBrightnessLongTap(Landroid/view/View;)V
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

    .line 18331
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$184;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 3

    if-nez p1, :cond_0

    .line 18334
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$184;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v1, -0x64

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 18336
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$184;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v2, 0x64

    invoke-virtual {v1, v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    :cond_1
    const/4 v1, 0x2

    if-ne p1, v1, :cond_2

    .line 18338
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$184;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v2, 0x32

    invoke-virtual {v1, v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    :cond_2
    const/4 v1, 0x3

    if-ne p1, v1, :cond_3

    .line 18340
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$184;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v1, v0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    :cond_3
    const/4 v1, 0x4

    if-ne p1, v1, :cond_4

    .line 18342
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$184;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/tools/A;->brightnessValue:I

    add-int/2addr v2, v0

    invoke-virtual {v1, v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    :cond_4
    const/4 v1, 0x5

    if-ne p1, v1, :cond_5

    .line 18344
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$184;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/tools/A;->brightnessValue:I

    sub-int/2addr v1, v0

    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    :cond_5
    return-void
.end method
