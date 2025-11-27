.class Lcom/flyersoft/moonreaderp/ActivityTxt$190$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$190;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$190;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$190;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 18498
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$190$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$190;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getTheme(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 18500
    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->saveTheme(Ljava/lang/String;Z)V

    .line 18501
    sget-object p1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getThemeOfBook(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    .line 18502
    const-string p1, "circle_only"

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->saveTheme(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method
