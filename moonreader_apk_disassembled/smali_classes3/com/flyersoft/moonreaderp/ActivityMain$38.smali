.class Lcom/flyersoft/moonreaderp/ActivityMain$38;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showMenu(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$isMulti:Z

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3740
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$38;->val$v:Landroid/view/View;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$38;->val$isMulti:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 3

    .line 3742
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$38;->val$v:Landroid/view/View;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$38;->val$isMulti:Z

    invoke-static {v0, p1, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdoMenuAction(Lcom/flyersoft/moonreaderp/ActivityMain;ILandroid/view/View;Z)V

    return-void
.end method
