.class Lcom/flyersoft/moonreaderp/ActivityTxt$32;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showOptionsMenu(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$fromButton:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V
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

    .line 2869
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$32;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$32;->val$fromButton:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    .line 2871
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$32;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$32;->val$fromButton:Z

    invoke-static {v0, p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoOptionsMenuClick(Lcom/flyersoft/moonreaderp/ActivityTxt;IZ)V

    return-void
.end method
