.class public final Lorg/apache/commons/vfs2/util/Os;
.super Ljava/lang/Object;
.source "Os.java"


# static fields
.field private static final ALL_FAMILIES:[Lorg/apache/commons/vfs2/util/OsFamily;

.field private static final OS_ALL_FAMILIES:[Lorg/apache/commons/vfs2/util/OsFamily;

.field private static final OS_ARCH:Ljava/lang/String;

.field private static final OS_FAMILY:Lorg/apache/commons/vfs2/util/OsFamily;

.field public static final OS_FAMILY_DOS:Lorg/apache/commons/vfs2/util/OsFamily;

.field public static final OS_FAMILY_MAC:Lorg/apache/commons/vfs2/util/OsFamily;

.field public static final OS_FAMILY_NETWARE:Lorg/apache/commons/vfs2/util/OsFamily;

.field public static final OS_FAMILY_OS2:Lorg/apache/commons/vfs2/util/OsFamily;

.field public static final OS_FAMILY_OSX:Lorg/apache/commons/vfs2/util/OsFamily;

.field public static final OS_FAMILY_UNIX:Lorg/apache/commons/vfs2/util/OsFamily;

.field public static final OS_FAMILY_WIN9X:Lorg/apache/commons/vfs2/util/OsFamily;

.field public static final OS_FAMILY_WINDOWS:Lorg/apache/commons/vfs2/util/OsFamily;

.field public static final OS_FAMILY_WINNT:Lorg/apache/commons/vfs2/util/OsFamily;

.field private static final OS_NAME:Ljava/lang/String;

.field private static final OS_VERSION:Ljava/lang/String;

.field private static final PATH_SEP:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 33
    new-instance v0, Lorg/apache/commons/vfs2/util/OsFamily;

    const-string v1, "windows"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/util/OsFamily;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_WINDOWS:Lorg/apache/commons/vfs2/util/OsFamily;

    .line 38
    new-instance v1, Lorg/apache/commons/vfs2/util/OsFamily;

    const-string v2, "dos"

    invoke-direct {v1, v2}, Lorg/apache/commons/vfs2/util/OsFamily;-><init>(Ljava/lang/String;)V

    sput-object v1, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_DOS:Lorg/apache/commons/vfs2/util/OsFamily;

    .line 43
    new-instance v2, Lorg/apache/commons/vfs2/util/OsFamily;

    const/4 v3, 0x1

    new-array v4, v3, [Lorg/apache/commons/vfs2/util/OsFamily;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const-string v6, "nt"

    invoke-direct {v2, v6, v4}, Lorg/apache/commons/vfs2/util/OsFamily;-><init>(Ljava/lang/String;[Lorg/apache/commons/vfs2/util/OsFamily;)V

    sput-object v2, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_WINNT:Lorg/apache/commons/vfs2/util/OsFamily;

    .line 48
    new-instance v4, Lorg/apache/commons/vfs2/util/OsFamily;

    const/4 v6, 0x2

    new-array v7, v6, [Lorg/apache/commons/vfs2/util/OsFamily;

    aput-object v0, v7, v5

    aput-object v1, v7, v3

    const-string v8, "win9x"

    invoke-direct {v4, v8, v7}, Lorg/apache/commons/vfs2/util/OsFamily;-><init>(Ljava/lang/String;[Lorg/apache/commons/vfs2/util/OsFamily;)V

    sput-object v4, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_WIN9X:Lorg/apache/commons/vfs2/util/OsFamily;

    .line 54
    new-instance v7, Lorg/apache/commons/vfs2/util/OsFamily;

    new-array v8, v3, [Lorg/apache/commons/vfs2/util/OsFamily;

    aput-object v1, v8, v5

    const-string v9, "os/2"

    invoke-direct {v7, v9, v8}, Lorg/apache/commons/vfs2/util/OsFamily;-><init>(Ljava/lang/String;[Lorg/apache/commons/vfs2/util/OsFamily;)V

    sput-object v7, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_OS2:Lorg/apache/commons/vfs2/util/OsFamily;

    .line 59
    new-instance v8, Lorg/apache/commons/vfs2/util/OsFamily;

    const-string v9, "netware"

    invoke-direct {v8, v9}, Lorg/apache/commons/vfs2/util/OsFamily;-><init>(Ljava/lang/String;)V

    sput-object v8, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_NETWARE:Lorg/apache/commons/vfs2/util/OsFamily;

    .line 64
    new-instance v9, Lorg/apache/commons/vfs2/util/OsFamily;

    const-string v10, "unix"

    invoke-direct {v9, v10}, Lorg/apache/commons/vfs2/util/OsFamily;-><init>(Ljava/lang/String;)V

    sput-object v9, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_UNIX:Lorg/apache/commons/vfs2/util/OsFamily;

    .line 69
    new-instance v10, Lorg/apache/commons/vfs2/util/OsFamily;

    const-string v11, "mac"

    invoke-direct {v10, v11}, Lorg/apache/commons/vfs2/util/OsFamily;-><init>(Ljava/lang/String;)V

    sput-object v10, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_MAC:Lorg/apache/commons/vfs2/util/OsFamily;

    .line 74
    new-instance v11, Lorg/apache/commons/vfs2/util/OsFamily;

    new-array v12, v6, [Lorg/apache/commons/vfs2/util/OsFamily;

    aput-object v9, v12, v5

    aput-object v10, v12, v3

    const-string v13, "osx"

    invoke-direct {v11, v13, v12}, Lorg/apache/commons/vfs2/util/OsFamily;-><init>(Ljava/lang/String;[Lorg/apache/commons/vfs2/util/OsFamily;)V

    sput-object v11, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_OSX:Lorg/apache/commons/vfs2/util/OsFamily;

    .line 76
    const-string v12, "os.name"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    sput-object v12, Lorg/apache/commons/vfs2/util/Os;->OS_NAME:Ljava/lang/String;

    .line 77
    const-string v12, "os.arch"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    sput-object v12, Lorg/apache/commons/vfs2/util/Os;->OS_ARCH:Ljava/lang/String;

    .line 78
    const-string v12, "os.version"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    sput-object v12, Lorg/apache/commons/vfs2/util/Os;->OS_VERSION:Ljava/lang/String;

    .line 79
    sget-object v12, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    sput-object v12, Lorg/apache/commons/vfs2/util/Os;->PATH_SEP:Ljava/lang/String;

    const/16 v12, 0x9

    .line 83
    new-array v12, v12, [Lorg/apache/commons/vfs2/util/OsFamily;

    aput-object v1, v12, v5

    aput-object v10, v12, v3

    aput-object v8, v12, v6

    const/4 v1, 0x3

    aput-object v7, v12, v1

    const/4 v1, 0x4

    aput-object v11, v12, v1

    const/4 v1, 0x5

    aput-object v9, v12, v1

    const/4 v1, 0x6

    aput-object v0, v12, v1

    const/4 v0, 0x7

    aput-object v2, v12, v0

    const/16 v0, 0x8

    aput-object v4, v12, v0

    sput-object v12, Lorg/apache/commons/vfs2/util/Os;->ALL_FAMILIES:[Lorg/apache/commons/vfs2/util/OsFamily;

    .line 87
    invoke-static {}, Lorg/apache/commons/vfs2/util/Os;->determineOsFamily()Lorg/apache/commons/vfs2/util/OsFamily;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY:Lorg/apache/commons/vfs2/util/OsFamily;

    .line 88
    invoke-static {}, Lorg/apache/commons/vfs2/util/Os;->determineAllFamilies()[Lorg/apache/commons/vfs2/util/OsFamily;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_ALL_FAMILIES:[Lorg/apache/commons/vfs2/util/OsFamily;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static archMatches(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_0

    .line 209
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_ARCH:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method private static determineAllFamilies()[Lorg/apache/commons/vfs2/util/OsFamily;
    .locals 6

    .line 236
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 237
    sget-object v1, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY:Lorg/apache/commons/vfs2/util/OsFamily;

    if-eqz v1, :cond_1

    .line 238
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 239
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x0

    .line 241
    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/util/OsFamily;

    .line 242
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 243
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/util/OsFamily;->getFamilies()[Lorg/apache/commons/vfs2/util/OsFamily;

    move-result-object v3

    .line 244
    array-length v4, v3

    :goto_0
    if-ge v1, v4, :cond_0

    aget-object v5, v3, v1

    .line 245
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 249
    :cond_1
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/commons/vfs2/util/OsFamily;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/util/OsFamily;

    return-object v0
.end method

.method private static determineOsFamily()Lorg/apache/commons/vfs2/util/OsFamily;
    .locals 3

    .line 254
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_NAME:Ljava/lang/String;

    const-string v1, "windows"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-le v1, v2, :cond_2

    .line 255
    const-string v1, "xp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gt v1, v2, :cond_1

    const-string v1, "2000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gt v1, v2, :cond_1

    const-string v1, "nt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-le v0, v2, :cond_0

    goto :goto_0

    .line 258
    :cond_0
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_WIN9X:Lorg/apache/commons/vfs2/util/OsFamily;

    return-object v0

    .line 256
    :cond_1
    :goto_0
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_WINNT:Lorg/apache/commons/vfs2/util/OsFamily;

    return-object v0

    .line 259
    :cond_2
    const-string v1, "os/2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-le v1, v2, :cond_3

    .line 260
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_OS2:Lorg/apache/commons/vfs2/util/OsFamily;

    return-object v0

    .line 261
    :cond_3
    const-string v1, "netware"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-le v1, v2, :cond_4

    .line 262
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_NETWARE:Lorg/apache/commons/vfs2/util/OsFamily;

    return-object v0

    .line 263
    :cond_4
    const-string v1, "mac"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-le v1, v2, :cond_6

    .line 264
    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 265
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_OSX:Lorg/apache/commons/vfs2/util/OsFamily;

    return-object v0

    .line 267
    :cond_5
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_MAC:Lorg/apache/commons/vfs2/util/OsFamily;

    return-object v0

    .line 268
    :cond_6
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->PATH_SEP:Ljava/lang/String;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 269
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_UNIX:Lorg/apache/commons/vfs2/util/OsFamily;

    return-object v0

    :cond_7
    const/4 v0, 0x0

    return-object v0
.end method

.method private static familyMatches(Lorg/apache/commons/vfs2/util/OsFamily;)Z
    .locals 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 226
    :cond_0
    sget-object v1, Lorg/apache/commons/vfs2/util/Os;->OS_ALL_FAMILIES:[Lorg/apache/commons/vfs2/util/OsFamily;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    if-ne p0, v4, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public static getFamily(Ljava/lang/String;)Lorg/apache/commons/vfs2/util/OsFamily;
    .locals 5

    .line 189
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->ALL_FAMILIES:[Lorg/apache/commons/vfs2/util/OsFamily;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 190
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/util/OsFamily;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static isArch(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    .line 114
    move-object v1, v0

    check-cast v1, Lorg/apache/commons/vfs2/util/OsFamily;

    invoke-static {v0, v0, p0, v0}, Lorg/apache/commons/vfs2/util/Os;->isOs(Lorg/apache/commons/vfs2/util/OsFamily;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isFamily(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 124
    invoke-static {p0, v0, v0, v0}, Lorg/apache/commons/vfs2/util/Os;->isOs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isFamily(Lorg/apache/commons/vfs2/util/OsFamily;)Z
    .locals 1

    const/4 v0, 0x0

    .line 134
    invoke-static {p0, v0, v0, v0}, Lorg/apache/commons/vfs2/util/Os;->isOs(Lorg/apache/commons/vfs2/util/OsFamily;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isName(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    .line 145
    move-object v1, v0

    check-cast v1, Lorg/apache/commons/vfs2/util/OsFamily;

    invoke-static {v0, p0, v0, v0}, Lorg/apache/commons/vfs2/util/Os;->isOs(Lorg/apache/commons/vfs2/util/OsFamily;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isOs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 158
    invoke-static {p0}, Lorg/apache/commons/vfs2/util/Os;->getFamily(Ljava/lang/String;)Lorg/apache/commons/vfs2/util/OsFamily;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/util/Os;->isOs(Lorg/apache/commons/vfs2/util/OsFamily;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isOs(Lorg/apache/commons/vfs2/util/OsFamily;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    if-nez p0, :cond_1

    if-nez p1, :cond_1

    if-nez p2, :cond_1

    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    return v0

    .line 172
    :cond_1
    :goto_0
    invoke-static {p0}, Lorg/apache/commons/vfs2/util/Os;->familyMatches(Lorg/apache/commons/vfs2/util/OsFamily;)Z

    move-result p0

    .line 173
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/Os;->nameMatches(Ljava/lang/String;)Z

    move-result p1

    .line 174
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/Os;->archMatches(Ljava/lang/String;)Z

    move-result p2

    .line 175
    invoke-static {p3}, Lorg/apache/commons/vfs2/util/Os;->versionMatches(Ljava/lang/String;)Z

    move-result p3

    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v0
.end method

.method public static isVersion(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    .line 104
    move-object v1, v0

    check-cast v1, Lorg/apache/commons/vfs2/util/OsFamily;

    invoke-static {v0, v0, v0, p0}, Lorg/apache/commons/vfs2/util/Os;->isOs(Lorg/apache/commons/vfs2/util/OsFamily;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static nameMatches(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_0

    .line 217
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_NAME:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method private static versionMatches(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_0

    .line 201
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_VERSION:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method
