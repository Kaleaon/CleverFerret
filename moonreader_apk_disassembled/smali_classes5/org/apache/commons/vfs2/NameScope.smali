.class public final enum Lorg/apache/commons/vfs2/NameScope;
.super Ljava/lang/Enum;
.source "NameScope.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/NameScope;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/NameScope;

.field public static final enum CHILD:Lorg/apache/commons/vfs2/NameScope;

.field public static final enum DESCENDENT:Lorg/apache/commons/vfs2/NameScope;

.field public static final enum DESCENDENT_OR_SELF:Lorg/apache/commons/vfs2/NameScope;

.field public static final enum FILE_SYSTEM:Lorg/apache/commons/vfs2/NameScope;


# instance fields
.field private final realName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 27
    new-instance v0, Lorg/apache/commons/vfs2/NameScope;

    const-string v1, "child"

    const-string v2, "CHILD"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lorg/apache/commons/vfs2/NameScope;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/apache/commons/vfs2/NameScope;->CHILD:Lorg/apache/commons/vfs2/NameScope;

    .line 33
    new-instance v1, Lorg/apache/commons/vfs2/NameScope;

    const-string v2, "descendent"

    const-string v4, "DESCENDENT"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lorg/apache/commons/vfs2/NameScope;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT:Lorg/apache/commons/vfs2/NameScope;

    .line 40
    new-instance v2, Lorg/apache/commons/vfs2/NameScope;

    const-string v4, "descendent_or_self"

    const-string v6, "DESCENDENT_OR_SELF"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v4}, Lorg/apache/commons/vfs2/NameScope;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT_OR_SELF:Lorg/apache/commons/vfs2/NameScope;

    .line 53
    new-instance v4, Lorg/apache/commons/vfs2/NameScope;

    const-string v6, "filesystem"

    const-string v8, "FILE_SYSTEM"

    const/4 v9, 0x3

    invoke-direct {v4, v8, v9, v6}, Lorg/apache/commons/vfs2/NameScope;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lorg/apache/commons/vfs2/NameScope;->FILE_SYSTEM:Lorg/apache/commons/vfs2/NameScope;

    const/4 v6, 0x4

    .line 22
    new-array v6, v6, [Lorg/apache/commons/vfs2/NameScope;

    aput-object v0, v6, v3

    aput-object v1, v6, v5

    aput-object v2, v6, v7

    aput-object v4, v6, v9

    sput-object v6, Lorg/apache/commons/vfs2/NameScope;->$VALUES:[Lorg/apache/commons/vfs2/NameScope;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 58
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 59
    iput-object p3, p0, Lorg/apache/commons/vfs2/NameScope;->realName:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/NameScope;
    .locals 1

    .line 22
    const-class v0, Lorg/apache/commons/vfs2/NameScope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/NameScope;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/NameScope;
    .locals 1

    .line 22
    sget-object v0, Lorg/apache/commons/vfs2/NameScope;->$VALUES:[Lorg/apache/commons/vfs2/NameScope;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/NameScope;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/NameScope;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Lorg/apache/commons/vfs2/NameScope;->realName:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 69
    iget-object v0, p0, Lorg/apache/commons/vfs2/NameScope;->realName:Ljava/lang/String;

    return-object v0
.end method
