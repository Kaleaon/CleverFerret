.class Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2;

.field final synthetic val$author:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2;Ljava/lang/String;)V
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

    .line 8651
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2$1;->val$author:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 8654
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2$1;->val$author:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->showShelfForAuthor(Ljava/lang/String;)V

    return-void
.end method
