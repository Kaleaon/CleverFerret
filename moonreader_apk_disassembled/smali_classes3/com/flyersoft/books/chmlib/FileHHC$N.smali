.class public final enum Lcom/flyersoft/books/chmlib/FileHHC$N;
.super Ljava/lang/Enum;
.source "FileHHC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/chmlib/FileHHC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "N"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/books/chmlib/FileHHC$N;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/books/chmlib/FileHHC$N;

.field public static final enum children:Lcom/flyersoft/books/chmlib/FileHHC$N;

.field public static final enum id:Lcom/flyersoft/books/chmlib/FileHHC$N;

.field public static final enum name:Lcom/flyersoft/books/chmlib/FileHHC$N;

.field public static final enum url:Lcom/flyersoft/books/chmlib/FileHHC$N;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/books/chmlib/FileHHC$N;
    .locals 3

    const/4 v0, 0x4

    .line 18
    new-array v0, v0, [Lcom/flyersoft/books/chmlib/FileHHC$N;

    sget-object v1, Lcom/flyersoft/books/chmlib/FileHHC$N;->name:Lcom/flyersoft/books/chmlib/FileHHC$N;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/FileHHC$N;->url:Lcom/flyersoft/books/chmlib/FileHHC$N;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/FileHHC$N;->id:Lcom/flyersoft/books/chmlib/FileHHC$N;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/FileHHC$N;->children:Lcom/flyersoft/books/chmlib/FileHHC$N;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 18
    new-instance v0, Lcom/flyersoft/books/chmlib/FileHHC$N;

    const-string v1, "name"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/FileHHC$N;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC$N;->name:Lcom/flyersoft/books/chmlib/FileHHC$N;

    new-instance v0, Lcom/flyersoft/books/chmlib/FileHHC$N;

    const-string v1, "url"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/FileHHC$N;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC$N;->url:Lcom/flyersoft/books/chmlib/FileHHC$N;

    new-instance v0, Lcom/flyersoft/books/chmlib/FileHHC$N;

    const-string v1, "id"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/FileHHC$N;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC$N;->id:Lcom/flyersoft/books/chmlib/FileHHC$N;

    new-instance v0, Lcom/flyersoft/books/chmlib/FileHHC$N;

    const-string v1, "children"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/FileHHC$N;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC$N;->children:Lcom/flyersoft/books/chmlib/FileHHC$N;

    invoke-static {}, Lcom/flyersoft/books/chmlib/FileHHC$N;->$values()[Lcom/flyersoft/books/chmlib/FileHHC$N;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/FileHHC$N;->$VALUES:[Lcom/flyersoft/books/chmlib/FileHHC$N;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
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

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 18
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/FileHHC$N;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 18
    const-class v0, Lcom/flyersoft/books/chmlib/FileHHC$N;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/books/chmlib/FileHHC$N;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/books/chmlib/FileHHC$N;
    .locals 1

    .line 18
    sget-object v0, Lcom/flyersoft/books/chmlib/FileHHC$N;->$VALUES:[Lcom/flyersoft/books/chmlib/FileHHC$N;

    invoke-virtual {v0}, [Lcom/flyersoft/books/chmlib/FileHHC$N;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/books/chmlib/FileHHC$N;

    return-object v0
.end method
