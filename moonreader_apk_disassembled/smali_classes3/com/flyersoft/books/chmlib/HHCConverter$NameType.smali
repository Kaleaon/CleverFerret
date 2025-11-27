.class public final enum Lcom/flyersoft/books/chmlib/HHCConverter$NameType;
.super Ljava/lang/Enum;
.source "HHCConverter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/chmlib/HHCConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NameType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/books/chmlib/HHCConverter$NameType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

.field public static final enum local:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

.field public static final enum name:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

.field public static final enum unknown:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/books/chmlib/HHCConverter$NameType;
    .locals 3

    const/4 v0, 0x3

    .line 96
    new-array v0, v0, [Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    sget-object v1, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->unknown:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->name:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->local:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 96
    new-instance v0, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    const-string v1, "unknown"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->unknown:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    new-instance v0, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    const-string v1, "name"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->name:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    new-instance v0, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    const-string v1, "local"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->local:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    invoke-static {}, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->$values()[Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->$VALUES:[Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

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

    .line 96
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/HHCConverter$NameType;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 96
    const-class v0, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/books/chmlib/HHCConverter$NameType;
    .locals 1

    .line 96
    sget-object v0, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->$VALUES:[Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    invoke-virtual {v0}, [Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    return-object v0
.end method
