.class Lcom/flyersoft/moonreaderp/ActivityMain$122$3;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$122;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$122;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 10371
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 10373
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    iput p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain$122;->selected:I

    return-void
.end method
