.class Lcom/flyersoft/moonreaderp/ActivityMain$101$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$101;->done(Lcom/flyersoft/tools/BookDb$BookInfo;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$101;

.field final synthetic val$checked:[Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$101;[Z)V
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

    .line 9327
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$101;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101$2;->val$checked:[Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 0

    .line 9329
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101$2;->val$checked:[Z

    aput-boolean p3, p1, p2

    return-void
.end method
