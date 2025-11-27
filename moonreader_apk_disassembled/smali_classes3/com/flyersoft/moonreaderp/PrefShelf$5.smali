.class Lcom/flyersoft/moonreaderp/PrefShelf$5;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->initView()V
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

    .line 232
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$5;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    if-eqz p2, :cond_0

    .line 235
    sget-boolean v0, Lcom/flyersoft/tools/A;->sysHasDynamicColors:Z

    if-nez v0, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->customDynamicColor:I

    if-nez v0, :cond_0

    .line 236
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$5;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mshowCustomDynamicPicker(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    const/4 p2, 0x0

    .line 237
    invoke-virtual {p1, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    return-void

    .line 240
    :cond_0
    sput-boolean p2, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    .line 241
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$5;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mdoAfterDynamicColorChanged(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    return-void
.end method
