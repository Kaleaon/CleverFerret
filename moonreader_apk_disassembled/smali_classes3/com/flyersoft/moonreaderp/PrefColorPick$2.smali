.class Lcom/flyersoft/moonreaderp/PrefColorPick$2;
.super Ljava/lang/Object;
.source "PrefColorPick.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefColorPick;->initView(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefColorPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 148
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$2;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 151
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$2;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/miscellaneous/AnimalTools;->startJdllyAnimal(Landroid/view/View;FZ)V

    return-void
.end method
