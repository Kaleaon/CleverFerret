.class Lcom/flyersoft/moonreaderp/ActivityMain$35;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showAdFreeOptions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 3403
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$35;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 3406
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$35;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->adFreeSelected:I

    return-void
.end method
