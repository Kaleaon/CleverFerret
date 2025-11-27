.class Lcom/flyersoft/tools/compress/BaseCompressor$1;
.super Ljava/lang/Object;
.source "BaseCompressor.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/compress/BaseCompressor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/tools/compress/BaseCompressor;


# direct methods
.method constructor <init>(Lcom/flyersoft/tools/compress/BaseCompressor;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 37
    iput-object p1, p0, Lcom/flyersoft/tools/compress/BaseCompressor$1;->this$0:Lcom/flyersoft/tools/compress/BaseCompressor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 37
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/tools/compress/BaseCompressor$1;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public compare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 39
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    .line 40
    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, -0x1

    if-eqz v1, :cond_0

    if-nez v0, :cond_0

    return v2

    :cond_0
    const/4 v3, 0x1

    if-eqz v0, :cond_1

    if-nez v1, :cond_1

    return v3

    .line 46
    :cond_1
    invoke-static {p1}, Lcom/flyersoft/tools/A;->isSupportedFile(Ljava/lang/String;)Z

    move-result v0

    .line 47
    invoke-static {p2}, Lcom/flyersoft/tools/A;->isSupportedFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v0, :cond_2

    if-nez v1, :cond_2

    return v2

    :cond_2
    if-eqz v1, :cond_3

    if-nez v0, :cond_3

    return v3

    .line 53
    :cond_3
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1
.end method
