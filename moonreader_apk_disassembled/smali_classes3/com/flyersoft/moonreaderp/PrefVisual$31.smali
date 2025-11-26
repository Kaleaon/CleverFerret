.class Lcom/flyersoft/moonreaderp/PrefVisual$31;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1048
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$31;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getTheme(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 1050
    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->saveTheme(Ljava/lang/String;Z)V

    return-void
.end method
