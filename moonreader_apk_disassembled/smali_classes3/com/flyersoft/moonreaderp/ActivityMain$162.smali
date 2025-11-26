.class Lcom/flyersoft/moonreaderp/ActivityMain$162;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->isPermissonOk(Z)Z
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

    .line 14058
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$162;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 14061
    const-string p1, "android.permission.READ_EXTERNAL_STORAGE"

    const-string p2, "android.permission.WRITE_EXTERNAL_STORAGE"

    filled-new-array {p1, p2}, [Ljava/lang/String;

    move-result-object p1

    .line 14062
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$162;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/16 v0, 0xc8

    invoke-static {p2, p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Lcom/flyersoft/moonreaderp/ActivityMain;[Ljava/lang/String;I)V

    return-void
.end method
