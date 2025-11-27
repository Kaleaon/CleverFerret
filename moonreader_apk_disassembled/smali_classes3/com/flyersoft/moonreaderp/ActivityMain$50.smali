.class Lcom/flyersoft/moonreaderp/ActivityMain$50;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->shelfFocusToBook(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$index:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;I)V
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

    .line 4501
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$50;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$50;->val$index:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 4504
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$50;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$50;->val$index:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->showFocusItem(I)V

    return-void
.end method
