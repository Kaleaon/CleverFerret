.class Lcom/flyersoft/moonreaderp/ActivityTxt$77;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showAdjustBrightnessTip()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$cb:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/CheckBox;)V
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

    .line 7488
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$77;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$77;->val$cb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 7491
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$77;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->adjustBrightness:Z

    .line 7492
    sget-boolean p1, Lcom/flyersoft/tools/A;->adjustBrightness:Z

    if-nez p1, :cond_0

    .line 7493
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$77;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 p2, -0x64

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    :cond_0
    return-void
.end method
